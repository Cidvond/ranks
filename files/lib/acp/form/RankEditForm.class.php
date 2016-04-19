<?php namespace wcf\acp\form;

class RankEditForm extends RankAddForm
{
    protected $modelAction = 'update';

    protected $templateAction = 'edit';

    protected $requiresValidObject = true;

    protected function getObjectTypeName() {
        return 'wcf\data\rank\Rank';
    }
}
