<?php namespace wcf\acp\form;

use wcf\data\rank\RankCache;
use wcf\data\branch\Branch;
use wcf\form\FormBuilder;
use wcf\system\WCF;

class RankAddForm extends FormBuilder
{
    public $activeMenuItem = "wcf.acp.menu.link.clan.rank.add";

    public $neededPermissions = ['admin.clan.rank.canManageRanks'];

    protected function getAttributes()
    {
        return [
            'branchID' => 'class:\wcf\data\branch\Branch',
            'categoryID' => 'class:\wcf\data\category\Category',
            'name' => 'string',
            'prefix' => 'string',
            'paygrade' => 'string',
            'image' => 'url',
            'displayOrder' => 'int',
            'isDisabled' => 'bool',
        ];
    }

    public function assignVariables()
    {
        parent::assignVariables();

        $categories = RankCache::getInstance()->getCategories();
        unset($categories[null]);

        WCF::getTPL()->assign([
            // Miscellaneous
            'categories'   => $categories,
            'branches'     => Branch::getAllBranches(),
        ]);
    }
    
    protected function getObjectActionType()
    {
	    return 'wcf\data\rank\RankAction';
    }
}
