# Database Design and Assumptions (Solent Boats)

## Entities

- Staff
- Customer
- Boat
- Service
    - Service-Staff
- Role
    - Staff-Role
- Boatyard

## Assumptions

- Each boat has exactly one owner
- Each member of staff works at only one boatyard
- Any boat with more than one engine has multiple identical engines
- A boat may not have a fuel type or engine size, for example a sailboat