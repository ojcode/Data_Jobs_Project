/*
 Identify the top 20 skills that are in high demand and have the highest salaries for data analyst jobs
 -Highight top paying opportunities for Data Analysts, offering insights to Data into top skills
 */
SELECT sk2.skills as skillz,
    COUNT(jobs1.job_id) AS total_jobs,
    round(avg(salary_year_avg)) as avg_salary
FROM job_postings_fact jobs1
    LEFT JOIN skills_job_dim sk1 ON sk1.job_id = jobs1.job_id
    LEFT JOIN skills_dim sk2 on sk2.skill_id = sk1.skill_id
WHERE job_title_short = 'Data Analyst' --    AND job_work_from_home = 'TRUE'
    AND salary_year_avg > 0
    AND sk2.skills IS NOT NULL
GROUP BY sk2.skills
HAVING COUNT(jobs1.job_id) > 10
ORDER BY total_jobs DESC,
    avg_salary DESC
LIMIT 20;