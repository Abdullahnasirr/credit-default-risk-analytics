
-- Query 1: Overall default rate
SELECT 
    defaulted,
    COUNT(*) AS num_clients,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM clients), 2) AS pct
FROM clients
GROUP BY defaulted;

-- Query 2: Default rate by September repayment status
SELECT 
    pay_sept AS repayment_status,
    COUNT(*) AS num_clients,
    SUM(defaulted) AS num_defaults,
    ROUND(AVG(defaulted) * 100, 2) AS default_rate_pct
FROM clients
GROUP BY pay_sept
ORDER BY pay_sept;

-- Query 3: Default rate and average credit limit by age group
SELECT 
    CASE 
        WHEN age < 30 THEN '20s'
        WHEN age < 40 THEN '30s'
        WHEN age < 50 THEN '40s'
        WHEN age < 60 THEN '50s'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS num_clients,
    ROUND(AVG(defaulted) * 100, 2) AS default_rate_pct,
    ROUND(AVG(credit_limit), 0) AS avg_credit_limit
FROM clients
GROUP BY age_group
ORDER BY age_group;
