<?php namespace wcf\data\rank;

use wcf\data\branch\Branch;
use wcf\data\DatabaseObject;
use wcf\system\database\util\PreparedStatementConditionBuilder;
use wcf\system\WCF;
use wcf\util\StringUtil;

class Rank extends DatabaseObject
{
	protected static $databaseTableName = 'unkso_rank';
	
	protected static $databaseTableIndexName = 'rankID';

	/**
	 * @var wcf\data\branch\Branch
	 */
	public $branch;
	
	public function __construct($id, array $row = null, DatabaseObject $object = null)
	{
		parent::__construct($id, $row, $object);

		$this->branch = new Branch($this->branchID);
	}

	public function getImage($width = null) {
		if ($this->image) {
			$widthTag = !is_null($width) ? 'width="'.$width.'"' : '';
			$image = '<img src="'.(!preg_match('~^(/|https?://)~i', $this->image) ? WCF::getPath() : '').StringUtil::encodeHTML($this->image).'" alt="" '.$widthTag.' />';

			return $image;
		}

		return '';
	}
}

 