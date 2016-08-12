<?php namespace wcf\data\branch;

use wcf\data\DatabaseObject;
use wcf\system\database\util\PreparedStatementConditionBuilder;
use wcf\system\WCF;
use wcf\util\StringUtil;

class Branch extends DatabaseObject
{
	protected static $databaseTableName = 'unkso_branch';
	
	protected static $databaseTableIndexName = 'branchID';

	public function getImage() {
		if ($this->image) {
			$image = '<img src="'.(!preg_match('~^(/|https?://)~i', $this->image) ? WCF::getPath() : '').StringUtil::encodeHTML($this->image).'" alt="" />';

			return $image;
		}

		return '';
	}

	public static function getAllBranches()
	{
		$statement = WCF::getDB()->prepareStatement('SELECT * FROM ' . self::getDatabaseTableName() . ' ORDER BY displayOrder');
		$statement->execute([]);

		return $statement->fetchObjects(self::class);
	}
}