<?php namespace wcf\system\category;

use wcf\data\category\CategoryEditor;
use wcf\system\cache\builder\SmileyCacheBuilder;
use wcf\system\category\AbstractCategoryType;
use wcf\system\WCF;

class RankCategoryType extends AbstractCategoryType {
    protected $langVarPrefix = 'wcf.acp.clan.rank.category';

    protected $hasDescription = true;

    protected $maximumNestingLevel = 0;

    public function canAddCategory() {
        return $this->canEditCategory();
    }

    public function canDeleteCategory() {
        return $this->canEditCategory();
    }

    public function canEditCategory() {
        return WCF::getSession()->getPermission('admin.clan.rank.canManageRanks');
    }
}