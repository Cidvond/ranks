<?php namespace wcf\acp\page;

use wcf\data\category\Category;
use wcf\page\SortablePage;
use wcf\data\rank\RankCache;
use wcf\system\WCF;

class RankListPage extends SortablePage
{
    public $activeMenuItem = 'wcf.acp.menu.link.clan.rank.list';

    public $defaultSortField = 'displayOrder';

    public $neededPermissions = ['admin.clan.rank.canManageRanks'];

    public $objectListClassName = 'wcf\data\rank\RankList';

    public $templateName = 'rankList';

    public $validSortFields = ['rankID', 'displayOrder', 'name', 'paygrade'];

    public $categoryID = 0;

    public $category = null;

    public $categories = [];

    public function readParameters()
    {
        parent::readParameters();

        if (isset($_REQUEST['id'])) {
            $this->categoryID = intval($_REQUEST['id']);
            $this->category = new Category($this->categoryID);
            if (!$this->category->categoryID) {
                throw new IllegalLinkException();
            }
        }
    }

    public function assignVariables()
    {
        parent::assignVariables();

        if (is_null($this->category)) {
            $firstCategory = array_keys($this->categories)[0];
            $this->category = $this->categories[$firstCategory];
        }

        WCF::getTPL()->assign(array(
            'categories' => $this->categories,
            'category' => $this->category,
        ));
    }

    public function readData()
    {
        parent::readData();

        $this->categories = RankCache::getInstance()->getCategories();
    }

    protected function initObjectList()
    {
        parent::initObjectList();

        if ($this->categoryID) {
            $this->objectList->getConditionBuilder()->add('categoryID = ?', [$this->categoryID]);
        }
        elseif (!is_null($this->category)) {
            $this->objectList->getConditionBuilder()->add('categoryID IS NULL', []);
        }
    }
}