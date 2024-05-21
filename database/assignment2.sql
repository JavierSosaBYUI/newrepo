-- 5.1 Data for table `account`

INSERT INTO public.account (
   account_firstname,
   account_lastname,
   account_email,
   account_password
)

VALUES (
	'Tony', 
	'Stark', 
	'tony@starkent.com',
	'Iam1ronM@n'
	);

-- 5.2 Modify the Tony Stark record to change the account_type to "Admin".

UPDATE public.account 
SET account_type = 'Admin'
WHERE account_firstname = 'Tony';

-- 5.3 Delete the Tony Stark record from the database.

DELETE FROM public.account
WHERE account_firstname = 'Tony';

-- 5.4.1 Modify the "GM Hummer" record to read "a huge interior" rather than "small interiors" using a single query

--(Do NOT retype the entire description as part of the query)
/* UPDATE public.inventory 
SET inv_description = 'Do you have 6 kids and like to go offroading? The Hummer gives you a huge interior with an engine to get you out of any muddy or rocky situation'
WHERE inv_make = 'GM'; */

--5.4.2 Using REPLACE

UPDATE public.inventory
SET inv_description = REPLACE (inv_description, 'small interiors', 'a huge interior');

--replacing the article 'the' before the description fragment 'a huge interior'
UPDATE public.inventory
SET inv_description = REPLACE (inv_description, 'the a huge interior', 'a huge interior');


-- 5.5 JOIN SQL 
/* Use an inner join to select the make and model fields from the inventory table 
   and the classification name field from the classification table for inventory items 
   that belong to the "Sport" category */

SELECT
i.classification_id, 
i.inv_make, 
i.inv_model
FROM inventory i
INNER JOIN classification c
	ON c.classification_id = i.classification_id
	WHERE c.classification_id = 2;

-- 5.6 
/*Update all records in the inventory table to add "/vehicles" 
to the middle of the file path in the inv_image and inv_thumbnail columns using a single query */

UPDATE public.inventory
SET 
inv_image = REPLACE (inv_image, '/images', '/images/vehicles'),
inv_thumbnail = REPLACE (inv_thumbnail, '/images', '/images/vehicles');