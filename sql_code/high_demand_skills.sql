/*
 Identify the top 20 in-demand skills for data analyst jobs
 */
SELECT sk2.skills as skillz,
    COUNT(jobs1.job_id) AS total_jobs
FROM job_postings_fact jobs1
    LEFT JOIN skills_job_dim sk1 ON sk1.job_id = jobs1.job_id
    LEFT JOIN skills_dim sk2 on sk2.skill_id = sk1.skill_id
WHERE job_title_short = 'Data Analyst'
    AND sk2.skills IS NOT NULL
GROUP BY sk2.skills
ORDER BY total_jobs DESC
LIMIT 20;