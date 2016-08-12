<?php namespace wcf\data\rank;

use wcf\data\DatabaseObjectEditor;
use wcf\data\IEditableCachedObject;
use wcf\system\cache\builder\RankCacheBuilder;

class RankEditor extends DatabaseObjectEditor implements IEditableCachedObject
{
    protected static $baseClass = Rank::class;

    public static function resetCache()
    {
        RankCacheBuilder::getInstance()->reset();
    }
}