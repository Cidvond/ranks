<?php namespace wcf\acp\form;

class BranchEditForm extends BranchAddForm
{
    protected $modelAction = 'update';

    protected $templateAction = 'edit';

    protected $requiresValidObject = true;

    protected function getObjectTypeName()
    {
        return 'wcf\data\branch\Branch';
    }
}