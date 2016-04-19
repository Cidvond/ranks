<?php namespace wcf\system\cache\builder;

use wcf\system\WCF;

class RankCacheBuilder extends AbstractCacheBuilder
{
    protected function rebuild(array $parameters)
    {
        $data = [
            'ranks' => []
        ];

        // get ranks
        $sql = "SELECT		*
			FROM		wcf".WCF_N."_unkso_rank
			ORDER BY	displayOrder";
        $statement = WCF::getDB()->prepareStatement($sql);
        $statement->execute();
        while ($object = $statement->fetchObject('wcf\data\rank\Rank')) {
            $data['ranks'][$object->categoryID][$object->rankID] = $object;
        }

        return $data;
    }
}