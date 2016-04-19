<?php namespace wcf\data\rank;

use wcf\data\category\Category;
use wcf\data\rank\category\RankCategory;
use wcf\system\cache\builder\RankCacheBuilder;
use wcf\system\category\CategoryHandler;
use wcf\system\SingletonFactory;

class RankCache extends SingletonFactory
{
    protected $cachedRanks = [];

    protected $cachedCategories = [];

    protected $visibleCategories = null;

    protected function init()
    {
        // get smiley cache
        $this->cachedRanks = RankCacheBuilder::getInstance()->getData(array(), 'ranks');
        $rankCategories = CategoryHandler::getInstance()->getCategories('com.clanunknownsoldiers.rank.category');

        $this->cachedCategories[null] = new RankCategory(new Category(null, array(
            'categoryID' => null,
            'parentCategoryID' => 0,
            'title' => 'All Categories',
            'description' => '',
            'showOrder' => -1,
            'isDisabled' => 0
        )));

        foreach ($rankCategories as $key => $rankCategory) {
            $this->cachedCategories[$key] = new RankCategory($rankCategory);
        }
    }

    /**
     * @return wcf\data\rank\Rank[]
     */
    public function getRanks()
    {
        return $this->cachedRanks;
    }

    public function getCategories()
    {
        return $this->cachedCategories;
    }

    public function getVisibleCategories()
    {
        if ($this->visibleCategories === null) {
            $this->visibleCategories = array();

            foreach ($this->cachedCategories as $key => $category) {
                if (!$category->isDisabled) {
                    $category->loadRanks();

                    if (count($category)) {
                        $this->visibleCategories[$key] = $category;
                    }
                }
            }
        }

        return $this->visibleCategories;
    }

    public function getCategoryRanks($categoryID = null)
    {
        if (isset($this->cachedRanks[$categoryID])) return $this->cachedRanks[$categoryID];

        return [];
    }
}