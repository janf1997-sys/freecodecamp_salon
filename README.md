# Salon Appointment Scheduler

An interactive, terminal-based appointment booking engine and relational database suite built with **PostgreSQL** and **Bash** as part of the freeCodeCamp **Relational Database Certification**.

The application manages customer records dynamically, guides users through service selections with formatted CLI prompts, and schedules salon appointments by enforcing relational data integrity.

---

## 📌 Application Workflow & Data Flow

```text
                     ┌──────────────────────────┐
                     │ User Runs ./salon.sh     │
                     └─────────────┬────────────┘
                                   │
                                   ▼
                     ┌──────────────────────────┐
                     │ Display Service Menu     │
                     │ (Queried from services)  │
                     └─────────────┬────────────┘
                                   │
                                   ▼
                     ┌──────────────────────────┐
                     │ Prompt: Service Selection│
                     └─────────────┬────────────┘
                                   │
                 ┌─────────────────┴─────────────────┐
                 │                                   │
          (Invalid Service)                   (Valid Service)
                 ▼                                   ▼
┌─────────────────────────────────┐ ┌─────────────────────────────────┐
│ Re-display Service Menu with    │ │ Prompt for Customer Phone       │
│ "I could not find that service."│ └────────────────┬────────────────┘
└─────────────────────────────────┘                  │
                                                     ▼
                                    ┌─────────────────────────────────┐
                                    │ Check Database for Phone Number │
                                    └────────────────┬────────────────┘
                                                     │
                                   ┌─────────────────┴─────────────────┐
                                   │                                   │
                              (New Customer)                  (Existing Customer)
                                   ▼                                   ▼
                    ┌──────────────────────────────┐     ┌────────────────────────────┐
                    │ Prompt for Name & Insert     │     │ Fetch Existing Name        │
                    │ into customers Table         │     └─────────────┬──────────────┘
                    └──────────────┬───────────────┘                   │
                                   │                                   │
                                   └─────────────────┬─────────────────┘
                                                     │
                                                     ▼
                                    ┌─────────────────────────────────┐
                                    │ Prompt for Appointment Time     │
                                    └────────────────┬────────────────┘
                                                     │
                                                     ▼
                                    ┌─────────────────────────────────┐
                                    │ Insert into appointments Table  │
                                    └────────────────┬────────────────┘
                                                     │
                                                     ▼
                                    ┌─────────────────────────────────┐
                                    │ Output Confirmation Message     │
                                    └─────────────────────────────────┘
