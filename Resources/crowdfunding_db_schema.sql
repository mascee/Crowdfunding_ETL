-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/dhOgHa
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "campaigns" (
    "cf_id" INT   NOT NULL,
    "contact_ID" INT->contacts.contact_ID   NOT NULL,
    "company_name" VARCHAR(30)   NOT NULL,
    "description" VARCHAR(30)   NOT NULL,
    "goal" DOUBLE   NOT NULL,
    "pledged" DOUBLE   NOT NULL,
    "outcome" VARCHAR(10)   NOT NULL,
    "backers_count" INT   NOT NULL,
    "country" VARCHAR(20)   NOT NULL,
    "currency" VARCHAR(10)   NOT NULL,
    "launched_date" DATE   NOT NULL,
    "end_date" DATE   NOT NULL,
    "category_id" VARCHAR(10)   NOT NULL,
    "subcategory_id" VARCHAR(10)   NOT NULL,
    CONSTRAINT "pk_campaigns" PRIMARY KEY (
        "cf_id"
     )
);

CREATE TABLE "contacts" (
    "contact_ID" INT   NOT NULL,
    "first_name" VARCHAR(20)   NOT NULL,
    "last_name" VARCHAR(20)   NOT NULL,
    "email" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_ID"
     )
);

CREATE TABLE "category" (
    "id" SERIAL   NOT NULL,
    "category_id" VARCHAR(10)   NOT NULL,
    "category_name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "subcategory" (
    "id" SERIAL   NOT NULL,
    "subcategory_id" VARCHAR(10)   NOT NULL,
    "subcategory_name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "campaigns" ADD CONSTRAINT "fk_campaigns_contact_ID" FOREIGN KEY("contact_ID")
REFERENCES "contacts" ("contact_ID");

ALTER TABLE "campaigns" ADD CONSTRAINT "fk_campaigns_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaigns" ADD CONSTRAINT "fk_campaigns_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");

