CREATE TABLE "campaigns" (
    "cf_id" INT NOT NULL,
    "contact_ID" INT NOT NULL,
    "company_name" VARCHAR(30) NOT NULL,
    "description" VARCHAR(30) NOT NULL,
    "goal" DOUBLE PRECISION NOT NULL,
    "pledged" DOUBLE PRECISION NOT NULL,
    "outcome" VARCHAR(10) NOT NULL,
    "backers_count" INT NOT NULL,
    "country" VARCHAR(20) NOT NULL,
    "currency" VARCHAR(10) NOT NULL,
    "launched_date" DATE NOT NULL,
    "end_date" DATE NOT NULL,
    "category_id" VARCHAR(10) NOT NULL,
    "subcategory_id" VARCHAR(10) NOT NULL,
    CONSTRAINT "pk_campaigns" PRIMARY KEY ("cf_id")
);

SELECT * FROM campaigns;

CREATE TABLE "contacts" (
    "contact_ID" INT NOT NULL,
    "first_name" VARCHAR(20) NOT NULL,
    "last_name" VARCHAR(20) NOT NULL,
    "email" VARCHAR(30) NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY ("contact_ID")
);

SELECT * FROM contacts;

CREATE TABLE "category" (
    "id" SERIAL NOT NULL,
    "category_id" VARCHAR(10) NOT NULL,
    "category_name" VARCHAR(30) NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY ("id"),
    CONSTRAINT "uq_category_id" UNIQUE ("category_id")  -- Ensure category_id is unique
);

SELECT * FROM category;

CREATE TABLE "subcategory" (
    "id" SERIAL NOT NULL,
    "subcategory_id" VARCHAR(10) NOT NULL,
    "subcategory_name" VARCHAR(30) NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY ("id"),
    CONSTRAINT "uq_subcategory_id" UNIQUE ("subcategory_id")  -- Ensure subcategory_id is unique
);

SELECT * FROM subcategory;


-- Foreign key constraints
ALTER TABLE "campaigns" 
    ADD CONSTRAINT "fk_campaigns_contact_ID" FOREIGN KEY ("contact_ID")
    REFERENCES "contacts" ("contact_ID");

ALTER TABLE "campaigns" 
    ADD CONSTRAINT "fk_campaigns_category_id" FOREIGN KEY ("category_id")
    REFERENCES "category" ("category_id");

ALTER TABLE "campaigns" 
    ADD CONSTRAINT "fk_campaigns_subcategory_id" FOREIGN KEY ("subcategory_id")
    REFERENCES "subcategory" ("subcategory_id");
