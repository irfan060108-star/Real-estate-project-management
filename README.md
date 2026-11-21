# BuildPro - Real Estate Project Management Web Application (REPM)

> **Document Version:** 1.0  
> **Prepared For:** Real Estate Developers & Builders  
> **Specification Reference:** REPM Software Requirements Specification (SRS v1.0)  
> **UI Design Reference:** Replicated from BuildPro Dashboard Design Specification

---

## 🌟 Executive Summary

**BuildPro** is a modern, enterprise-grade Real Estate Project Management platform engineered to help real estate developers, contractors, and sales teams plan, track, and deliver residential and commercial developments from a single intuitive command center.

This repository contains both:
1. **Interactive Frontend Web Application (`index.html`)**: A production-grade, self-contained single-page application (SPA) built with React 18, Tailwind CSS, and Lucide icons that runs instantly in any web browser with **zero installation or setup required**.
2. **Complete Django REST Framework Backend (`backend/`)**: A decoupled backend architecture featuring custom JWT authentication, Role-Based Access Control (RBAC), database models, serializers, viewsets, and automated seed scripts following PEP 8 standards.
3. **Vite + React Source Code (`frontend/`)**: Standard modular React component architecture for production deployment.

---

## 🎨 UI Replication (Screenshot Fidelity)

The user interface matches the reference design with high visual precision:

| Element in Screenshot | Implementation in BuildPro |
| :--- | :--- |
| **Brand Sidebar** | Deep navy (`#0f2347`) with the stylized 3-tower **BuildPro** logo and sub-caption `"Real Estate Projects"`. |
| **Active Navigation Pill** | Vibrant blue (`#1b68ea`) active pill for **Dashboard**, plus links for Projects, Tasks, Schedule, Team, Reports, Settings, Units, and Clients. |
| **Bottom Brand Card** | Rounded dark container with house icon and watermark city silhouette: `"Building Better Tomorrows"`. |
| **Top Header** | Pill-shaped search bar (`"Search projects, tasks..."`), notification bell with unread badge counter `"3"`, and profile chip for **Irfan S**. |
| **Page Title Header** | Bold title `"Real Estate Project Management"` with tagline `"Plan • Track • Deliver"` and primary button `"+ New Project"`. |
| **4 Metric Summary Cards** | 1. **4** Total Projects (blue house)<br>2. **2** On Track (emerald checkmark)<br>3. **1** Delayed (amber clock)<br>4. **1** Completed (purple building). |
| **Featured Project Card** | **Skyline Residency** in Coimbatore with `"• On Track"` badge, high-resolution luxury apartment imagery, `"Construction Progress 72%"` with green progress bar, and `"View Details →"` button. |
| **Project Progress Card** | Donut chart showing **72% Overall Progress** in center, with color-coded legend: Completed 72% (Blue), In Progress 18% (Sky Blue), Not Started 10% (Slate). |
| **My Tasks Card** | Checkbox list with interactive toggles, priority badges (`High` in rose, `Medium` in amber, `Low` in blue), and due dates (`Nov 22`, `Nov 23`, `Nov 24`, `Nov 25`). |
| **Site Progress Card** | Real construction site photo with yellow crane and dark translucent badge: `"Latest Update • Nov 20, 2026"`. Clicking opens the site audit gallery. |
| **Upcoming Milestones Card**| Vertical connected timeline: **Foundation Completion** (Active Nov 25, 2026), **Structure Ready** (Dec 10, 2026), and **Hand Over** (Mar 15, 2027). |

---

## 🚀 How to Run the Application

### Option A: Instant Browser Launch (Recommended - Zero Setup)
Simply double-click or open `index.html` located at the root of this workspace in any browser (Google Chrome, Microsoft Edge, Mozilla Firefox, or Safari):
```powershell
# Open directly in default browser from terminal:
Start-Process index.html
```
- Fully interactive state management (projects, tasks, bookings, inventory, and reports).
- Switch user roles on the fly (Admin, Project Manager, Sales Executive, Site Engineer) to test RBAC.
- Create new projects, book units, mark tasks as complete, and export CSV reports.

---

### Option B: Backend (Django REST Framework)
To run the Django REST backend server:

```powershell
cd backend

# 1. Create and activate virtual environment
python -m venv venv
.\venv\Scripts\Activate.ps1

# 2. Install dependencies
pip install -r requirements.txt

# 3. Apply database migrations
python manage.py makemigrations
python manage.py migrate

# 4. Seed initial data (projects, tasks, units, clients, expenses)
python seed_data.py

# 5. Start the development server
python manage.py runserver
```
The REST API will be available at `http://localhost:8000/api/` with endpoints for `/auth/`, `/projects/`, `/units/`, `/clients/`, `/finances/`, `/documents/`, and `/reports/`.

---

## 📋 SRS Compliance Checklist

| SRS Section | Feature | Implementation Details | Status |
| :--- | :--- | :--- | :---: |
| **FR-AUTH-01 to 06** | User Authentication & RBAC | Custom User model supporting Admin, Project Manager, Sales Executive, Site Engineer, and Client. JWT token auth with SimpleJWT. | ✅ Complete |
| **FR-DASH-01 to 04** | Dashboard | 4 stat cards, featured showcase card, progress ring chart, tasks list, site inspection card, upcoming milestones. | ✅ Complete |
| **FR-PRJ-01 to 06** | Project Management | Create, edit, and archive projects. Search and filter by status, type, location. Calculates progress % from tasks. | ✅ Complete |
| **FR-TSK-01 to 05** | Tasks & Milestones | Milestones and tasks with priority levels (High, Medium, Low), assignees, due dates, and completion status. | ✅ Complete |
| **FR-UNT-01 to 05** | Unit / Inventory | Unit number, type (Flat, Villa, Plot, Shop), area, floor, price, status (Available, Booked, Sold). Blocks booking of non-available units (FR-UNT-05). | ✅ Complete |
| **FR-CLT-01 to 05** | Client & Lead Pipeline | 6-stage sales pipeline (New, Contacted, Site Visit, Negotiation, Converted, Lost). Automated booking flow linking client to unit and updating status (FR-CLT-05). | ✅ Complete |
| **FR-BUD-01 to 04** | Budget & Expenses | Project budget categories (Civil, Electrical, Interiors, Permits). Tracks spending and flags cost overruns. | ✅ Complete |
| **FR-DOC-01 to 03** | Document Management | Uploads for plans, approvals, and agreements with 10MB size limit and file type validation. | ✅ Complete |
| **FR-RPT-01 to 04** | Reports & Exports | Progress, financial, and sales reports with dynamic KPI cards, CSV export, and Print/PDF support. | ✅ Complete |

---

## 🗂 Project Structure

```
real estate/
├── index.html                   # Instant, self-contained interactive React SPA matching the UI image
├── README.md                    # Project documentation & architectural manual
├── backend/                     # Django REST Framework backend
│   ├── manage.py
│   ├── requirements.txt
│   ├── seed_data.py             # Pre-populates database with sample projects & tasks
│   ├── repm_backend/            # Core settings, routing, WSGI/ASGI
│   ├── authentication/          # User model & JWT authentication
│   ├── projects/                # Projects, Milestones, and Tasks
│   ├── units/                   # Units inventory & availability rules
│   ├── clients/                 # Leads pipeline, bookings, and payments
│   ├── finances/                # Budget categories & expense tracking
│   ├── documents/               # File uploads with validation
│   └── reports/                 # Summary statistics & executive reports
└── frontend/                    # Vite + React source files
    ├── package.json
    ├── vite.config.js
    ├── index.html
    └── src/
        ├── App.jsx
        ├── main.jsx
        └── index.css
```

---

## 👨‍💻 Prepared by
**BuildPro Engineering Team**  
*Building Better Tomorrows*
