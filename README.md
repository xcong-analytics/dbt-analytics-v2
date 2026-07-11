# Healthcare Analytics ELT Pipeline

An end-to-end healthcare analytics solution built with **Snowflake, dbt Core, SQL, Tableau, Python, and Git** to transform physician engagement data into analytics-ready models for executive reporting and business decision-making.
Pharmaceutical companies often track physician engagement across multiple activities, but raw data alone doesn't provide a clear picture of overall engagement. This project demonstrates how to transform raw interaction data into business metrics through a modern ELT pipeline.

---

## Tech Stack

**Data Warehouse:** Snowflake

**Transformation:** dbt Core 1.9

**Programming:** SQL, Python (Pandas, Faker)

**Visualization:** Tableau Public

**Version Control:** Git

---

# Business Problem

Healthcare organizations collect physician engagement data across conferences, educational programs, and pharmaceutical collaborations.

Without a standardized analytics pipeline, reporting becomes fragmented, data quality becomes difficult to maintain, and business reporting is hard to scale.

This project demonstrates how modern ELT architecture using Snowflake and dbt transforms raw operational data into trusted analytics models supporting physician engagement analysis, executive reporting, and strategic decision-making.

---

# Architecture

```
                Raw Data (Snowflake)

      PHYSICIANS
      PHARMA_CLIENTS
      EVENTS
      ENGAGEMENTS
                │
                ▼
         dbt Staging Layer
      • stg_physicians
      • stg_events
      • stg_engagements
      • stg_pharma_clients
                │
                ▼
        Analytics Layer
      • physician_engagement_score
      • physician_tier
      • client_performance
                │
                ▼
        Tableau Dashboard
                │
                ▼
 Executive Reporting & Business Insights
```

---

# Data Model

### Raw Tables

| Table | Description |
|------|-------------|
| PHYSICIANS | Physician demographics, specialty, publications, experience |
| PHARMA_CLIENTS | Pharmaceutical client information and budgets |
| EVENTS | Academic conferences and educational programs |
| ENGAGEMENTS | Physician participation and engagement records |

---

### dbt Staging Models

- `stg_physicians`
- `stg_pharma_clients`
- `stg_events`
- `stg_engagements`

---

### Analytics Models

### physician_engagement_score

Calculates physician engagement using weighted business metrics:

```
Conference Attendance × 40%
+ Speaking Events × 40%
+ Publications × 20%
```

---

### physician_tier

Classifies physicians into business-friendly engagement tiers.

| Tier | Score |
|------|------|
| Tier A | ≥20 |
| Tier B | ≥10 |
| Tier C | <10 |

---

### client_performance

Aggregates client-level KPIs including:

- Physician Count
- Average Engagement Score
- Event Count

---

# Dashboard

Interactive Tableau dashboard:

🔗 **View Dashboard**

Dashboard includes:

- Physician distribution by engagement tier
- Average engagement score by pharmaceutical client
- Executive KPI reporting
- Client performance comparison

---

# Business Insights

- Identified physician engagement patterns across 500+ physicians.
- Standardized physician engagement scoring for executive reporting.
- Built reusable analytics models supporting physician segmentation and client performance analysis.
- Automated dbt data quality testing to improve downstream reporting reliability.

---

# Data Quality Testing

Implemented automated dbt tests including:

- `not_null`
- `unique`
- Source validation
- Schema documentation

to ensure reliable analytics models.

---

# Run Project

```bash
# Activate environment
conda activate dbt-env

# Run models
dbt run

# Run tests
dbt test

# Generate documentation
dbt docs generate

# Launch documentation
dbt docs serve
```

---

# Project Structure

```
models/
└── physician_engagement/
    ├── sources.yml
    ├── schema.yml
    ├── stg_physicians.sql
    ├── stg_engagements.sql
    ├── stg_events.sql
    ├── stg_pharma_clients.sql
    ├── physician_engagement_score.sql
    ├── physician_tier.sql
    └── client_performance.sql
```

---

# Skills Demonstrated

- Modern ELT Pipeline Design
- dbt Core
- Snowflake
- SQL Data Modeling
- Data Quality Testing
- Healthcare Analytics
- Business Intelligence
- Tableau Dashboard Development
- Git Version Control

---

# Author

**Cong Xiao**

Senior Analytics Professional

Seattle, WA

LinkedIn: https://linkedin.com/in/congxiao

GitHub: https://github.com/xcong-analytics

---

# 📄 License

MIT
