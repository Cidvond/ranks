<?php namespace wcf\acp\form;

use wcf\form\FormBuilder;

class BranchAddForm extends FormBuilder
{
    public $activeMenuItem = "wcf.acp.menu.link.clan.branch.add";

    public $neededPermissions = ['admin.clan.branch.canManageBranches'];

    protected function getAttributes() {
        return [
            'branchID' => [
                'type' => 'int',
                'required' => false,
                'primary' => true,
                'skip' => true,
            ],
            'name' => 'string',
            'image' => [
                'type' => 'string',
                'rule' => 'url',
            ],
            'rankUnavailableImage' => [
                'type' => 'string',
                'rule' => 'url',
            ],
            'displayOrder' => 'int',
            'isDisabled' => 'bool',
        ];
    }

    protected function getObjectActionType() {
        return 'wcf\data\branch\BranchAction';
    }
}