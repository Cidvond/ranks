-- Create the Branch list table
CREATE TABLE wcf1_unkso_branch (
	branchID INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    userGroupID INT(10),
	name VARCHAR(255) NOT NULL,
	displayOrder INT(10) NOT NULL,
	image VARCHAR(500) NOT NULL,
	rankUnavailableImage VARCHAR(500) NOT NULL,
	isDisabled TINYINT(1) NOT NULL DEFAULT 0
);

-- Create the Ranks list table
CREATE TABLE wcf1_unkso_rank (
	rankID INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	branchID INT(10) NOT NULL,
	categoryID INT(10) NOT NULL,
	paygrade VARCHAR(20) NOT NULL,
	prefix VARCHAR(15) NOT NULL,
	name VARCHAR(255) NOT NULL,
	image VARCHAR(500) NOT NULL,
	displayOrder INT(10) NOT NULL,
	isDisabled TINYINT(1) NOT NULL DEFAULT 0
);

ALTER TABLE wcf1_unkso_branch ADD FOREIGN KEY (userGroupID) REFERENCES wcf1_user_group (groupID) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE wcf1_unkso_rank ADD FOREIGN KEY (branchID) REFERENCES wcf1_unkso_branch (branchID) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE wcf1_unkso_rank ADD FOREIGN KEY (categoryID) REFERENCES wcf1_category (categoryID) ON UPDATE CASCADE ON DELETE RESTRICT;