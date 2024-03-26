/*
 Identify the top 20 skills associated with the highest salaries for data analyst jobs
 */
SELECT sk2.skills as skillz,
    round(avg(salary_year_avg)) as avg_salary
FROM job_postings_fact jobs1
    LEFT JOIN skills_job_dim sk1 ON sk1.job_id = jobs1.job_id
    LEFT JOIN skills_dim sk2 on sk2.skill_id = sk1.skill_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg > 0
    AND salary_year_avg IS NOT NULL
    AND sk2.skills IS NOT NULL
GROUP BY sk2.skills
ORDER BY avg_salary DESC
LIMIT 20;