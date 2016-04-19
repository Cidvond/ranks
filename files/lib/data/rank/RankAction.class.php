<?php namespace wcf\data\rank;

use wcf\data\AbstractDatabaseObjectAction;
use wcf\data\IToggleAction;

class RankAction extends AbstractDatabaseObjectAction implements IToggleAction
{
    protected $className = 'wcf\data\rank\RankEditor';

    protected $permissionsDelete = ['admin.clan.rank.canManageRanks'];

    protected $permissionsUpdate = ['admin.clan.rank.canManageRanks'];

    protected $requireACP = ['delete', 'toggle', 'update', 'create'];

    public function toggle()
    {
        foreach ($this->objects as $rank) {
            $rank->update([
                'isDisabled' => $rank->isDisabled ? 0 : 1,
            ]);
        }
    }

    public function validateToggle()
    {
        parent::validateUpdate();
    }
}