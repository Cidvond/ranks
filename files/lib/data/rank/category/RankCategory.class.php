<?php
namespace wcf\data\rank\category;

use wcf\data\category\AbstractDecoratedCategory;
use wcf\data\rank\RankCache;
use wcf\data\ITraversableObject;
use wcf\system\exception\SystemException;
use wcf\system\WCF;

class RankCategory extends AbstractDecoratedCategory implements \Countable, ITraversableObject
{
    protected $index = 0;

    protected $indexToObject = null;

    /**
     * list of assigned ranks
     * @var	array<\wcf\data\rank\Rank>
     */
    public $ranks = null;

    /**
     * Loads associated ranks from cache.
     */
    public function loadRanks()
    {
        if ($this->ranks === null) {
            $this->ranks = RankCache::getInstance()->getCategoryRanks($this->categoryID);
            $this->indexToObject = array_keys($this->ranks);
        }
    }

    public function getRankTree()
    {
        $tree = [];

        foreach ($this->ranks as $rank) {
            $paygrade = $rank->paygrade;

            $tree['ranks'][$paygrade][$rank->branch->branchID] = $rank;
            $tree['paygrades'][] = $paygrade;
        }

        $tree['paygrades'] = array_unique($tree['paygrades']);

        return $tree;
    }

    /**
     * @see	\Countable::count()
     */
    public function count()
    {
        return count($this->ranks);
    }

    /**
     * @see	\Iterator::current()
     */
    public function current()
    {
        $objectID = $this->indexToObject[$this->index];
        return $this->ranks[$objectID];
    }

    /**
     * CAUTION: This methods does not return the current iterator index,
     * rather than the object key which maps to that index.
     *
     * @see	\Iterator::key()
     */
    public function key()
    {
        return $this->indexToObject[$this->index];
    }

    /**
     * @see	\Iterator::next()
     */
    public function next()
    {
        ++$this->index;
    }

    /**
     * @see	\Iterator::rewind()
     */
    public function rewind()
    {
        $this->index = 0;
    }

    /**
     * @see	\Iterator::valid()
     */
    public function valid()
    {
        return isset($this->indexToObject[$this->index]);
    }

    /**
     * @see	\SeekableIterator::seek()
     */
    public function seek($index)
    {
        $this->index = $index;

        if (!$this->valid()) {
            throw new \OutOfBoundsException();
        }
    }

    /**
     * @see	\wcf\data\ITraversableObject::seekTo()
     */
    public function seekTo($objectID)
    {
        $this->index = array_search($objectID, $this->indexToObject);

        if ($this->index === false) {
            throw new SystemException("object id '".$objectID."' is invalid");
        }
    }

    /**
     * @see	\wcf\data\ITraversableObject::search()
     */
    public function search($objectID)
    {
        try {
            $this->seekTo($objectID);
            return $this->current();
        }
        catch (SystemException $e) {
            return null;
        }
    }

    /**
     * Returns the category's name.
     *
     * @return	string
     */
    public function __toString()
    {
        return WCF::getLanguage()->get($this->title);
    }
}
