<?php namespace wcf\system\cache\builder;

use wcf\data\branch\Branch;
use wcf\data\rank\Rank;
use wcf\system\WCF;

class RankCacheBuilder extends AbstractCacheBuilder
{
    protected function rebuild(array $parameters)
    {
        $data = [
            'ranks' => $this->getRanks(),
            'branches' => $this->getBranches(),
        ];

        return $data;
    }

    protected function getRanks()
    {
        $sql = 'SELECT * FROM ' . Rank::getDatabaseTableName() . ' ORDER BY displayOrder ASC';
        $statement = WCF::getDB()->prepareStatement($sql);
        $statement->execute();

        $data = [];
        while ($object = $statement->fetchObject(Rank::class)) {
            $data[$object->categoryID][$object->rankID] = $object;
        }

        return $data;
    }

    protected function getBranches()
    {
        $sql = 'SELECT * FROM ' . Branch::getDatabaseTableName() . ' ORDER BY displayOrder ASC';
        $statement = WCF::getDB()->prepareStatement($sql);
        $statement->execute();

        $data = [];
        while ($object = $statement->fetchObject(Branch::class)) {
            $data[$object->branchID] = $object;
        }

        return $data;
    }
}