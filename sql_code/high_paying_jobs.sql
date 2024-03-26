/*
 To identify the highest paying data analyst jobs
 -Identify the top 100 highest paying data analyst jobs with remote availability
 -Only include jobs with specified salary (exclude nulls)
 
 */
SELECT --job_title_short as "Job Title",
    comp1.name AS "Company",
    ROUND(salary_year_avg) AS "Annual Salary",
    substring(job_via, 5) as "Applied Via",
    job_country as "Country",
    job_schedule_type "Job Schedule",
    job_posted_date::DATE as "Date Posted"
FROM job_postings_fact jobs1
    INNER JOIN company_dim comp1 ON jobs1.company_id = comp1.company_id --   INNER JOIN skills_job_dim sk1 ON sk1.job_id = jobs1.job_id
    -- INNER JOIN skills_dim sk2 on sk2.skill_id = sk1.skill_id
WHERE job_work_from_home = 'TRUE'
    AND job_title_short = 'Data Analyst'
    AND salary_year_avg > 0
    AND job_country IS NOT NULL
    AND job_schedule_type IS NOT NULL
GROUP BY job_title_short,
    job_via,
    job_country,
    job_schedule_type,
    job_posted_date::DATE,
    salary_year_avg,
    comp1.name
ORDER BY salary_year_avg DESC
LIMIT 100;