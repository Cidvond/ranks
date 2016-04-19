<?php namespace wcf\data\branch;

use wcf\data\AbstractDatabaseObjectAction;
use wcf\data\IToggleAction;

class BranchAction extends AbstractDatabaseObjectAction implements IToggleAction
{
    protected $className = 'wcf\data\branch\BranchEditor';

    protected $permissionsDelete = ['admin.clan.branch.canManageBranches'];

    protected $permissionsUpdate = ['admin.clan.branch.canManageBranches'];

    protected $requireACP = ['delete', 'toggle', 'update', 'create'];

    public function toggle()
    {
        foreach ($this->objects as $branch) {
            $branch->update([
                'isDisabled' => $branch->isDisabled ? 0 : 1,
            ]);
        }
    }

    public function validateToggle()
    {
        parent::validateUpdate();
    }
}