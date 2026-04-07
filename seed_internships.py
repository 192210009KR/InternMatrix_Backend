import mysql.connector
import sys
import os

DB_CONFIG = {
    'host': 'localhost',
    'user': 'root',
    'password': '',
    'database': 'internmatrix'
}

internships = [
    {
        "title": "AI Research Intern",
        "company": "DeepMind",
        "location": "Remote / London",
        "work_type": "Full-time",
        "duration": "6",
        "stipend": "45000",
        "deadline": "2026-06-30",
        "skills": "Python, PyTorch, Reinforcement Learning, Linear Algebra",
        "description": "Join our world-class research team to push the boundaries of Artificial Intelligence. You will work on cutting-edge reinforcement learning models and contribute to peer-reviewed publications. Ideal candidates have strong mathematical foundations and proficiency in deep learning frameworks."
    },
    {
        "title": "Full Stack Developer Intern",
        "company": "Stripe",
        "location": "San Francisco / Remote",
        "work_type": "On-site",
        "duration": "3",
        "stipend": "35000",
        "deadline": "2026-05-15",
        "skills": "React, TypeScript, Node.js, Ruby on Rails, PostgreSql",
        "description": "Help us build the economic infrastructure of the internet. You will work alongside senior engineers to develop scalable payment solutions and improve our developer dashboard. We value clean code, robust testing, and a passion for financial technology."
    },
    {
        "title": "UI/UX Design Intern",
        "company": "Airbnb",
        "location": "New York / Remote",
        "work_type": "Remote",
        "duration": "4",
        "stipend": "28000",
        "deadline": "2026-07-20",
        "skills": "Figma, Adobe XD, User Research, Prototyping, Design Systems",
        "description": "Design experiences and crafting stories for millions of travelers worldwide. You'll assist in creating high-fidelity prototypes and conducting usability studies. If you have a keen eye for detail and a user-centric mindset, we want to hear from you."
    },
    {
        "title": "Cybersecurity Analyst Intern",
        "company": "CrowdStrike",
        "location": "Austin, TX",
        "work_type": "Hybrid",
        "duration": "6",
        "stipend": "32000",
        "deadline": "2026-08-10",
        "skills": "Network Security, Penetration Testing, Wireshark, SIEM, SOC",
        "description": "Protect the world's most sensitive data. You will participate in threat hunting operations and help refine our incident response protocols. This is a high-impact role for students passionate about ethical hacking and network defense."
    },
    {
        "title": "Cloud Architect Intern",
        "company": "Amazon Web Services (AWS)",
        "location": "Seattle, WA",
        "work_type": "On-site",
        "duration": "3",
        "stipend": "38000",
        "deadline": "2026-05-30",
        "skills": "AWS, Docker, Kubernetes, Terraform, Go",
        "description": "Scale the clouds with AWS. Work on infrastructure-as-code projects and help automate deployment pipelines for enterprise customers. You will gain deep experience in serverless computing and container orchestration."
    },
    {
        "title": "Data Science & Analytics Intern",
        "company": "Netflix",
        "location": "Los Gatos, CA",
        "work_type": "On-site",
        "duration": "3",
        "stipend": "40000",
        "deadline": "2026-06-15",
        "skills": "SQL, Python, Pandas, Tableau, Statistics",
        "description": "Analyze viewer behavior to drive content strategy. You will work with massive datasets to identify trends and build predictive models for recommendation engines. Strong SQL skills and a love for entertainment are a must."
    }
]

def seed():
    try:
        conn = mysql.connector.connect(**DB_CONFIG)
        cursor = conn.cursor()
        
        print("Connected to database. Starting seeding...")
        
        for intern in internships:
            cursor.execute(
                """INSERT INTO internships (title, company, location, work_type, duration, stipend, deadline, skills, description) 
                   VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)""",
                (intern['title'], intern['company'], intern['location'], intern['work_type'], 
                 intern['duration'], intern['stipend'], intern['deadline'], intern['skills'], intern['description'])
            )
            intern_id = cursor.lastrowid
            
            # Also add a notification for all users
            cursor.execute("SELECT id FROM users")
            users = cursor.fetchall()
            for user in users:
                cursor.execute(
                    """INSERT INTO notifications (user_id, is_admin, title, message) 
                       VALUES (%s, %s, %s, %s)""",
                    (user[0], False, "New Opportunity!", f"Explore the new '{intern['title']}' role at '{intern['company']}'!")
                )
        
        conn.commit()
        print(f"Successfully seeded {len(internships)} internships and notified users.")
        
    except Exception as e:
        print(f"Error during seeding: {e}")
    finally:
        if 'cursor' in locals(): cursor.close()
        if 'conn' in locals(): conn.close()

if __name__ == "__main__":
    seed()
