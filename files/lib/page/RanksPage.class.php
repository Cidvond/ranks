<?php
namespace wcf\page;

use wcf\data\branch\Branch;
use wcf\data\rank\RankCache;
use wcf\system\WCF;

class RanksPage extends TrainingCenterPage
{
    public $activeMenuItem = 'wcf.page.training.ranks';

    public $templateName = 'rankList';

    public function assignVariables()
    {
        parent::assignVariables();

        WCF::getTPL()->assign([
            'categories' => RankCache::getInstance()->getVisibleCategories(),
            'branches'   => Branch::getAllBranches(),
        ]);
    }
}