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

	/**
	 * This is bodged! Please make this better!
	 * @return array
	 * @throws \wcf\system\database\DatabaseException
	 */
	public static function getAllBranches()
	{
		$table = self::$databaseTableName;
		$sql = "SELECT * FROM wcf".WCF_N."_$table";
		$statement = WCF::getDB()->prepareStatement($sql, 0);
		$statement->execute(array());

		$branches = [];
		while ($row = $statement->fetchArray()) {
			$branches[] = $row;
		}

		return $branches;
	}
}

 