<?php namespace wcf\page;

use wcf\data\rank\RankCache;
use wcf\system\WCF;

class RanksPage extends TrainingCenterPage
{
  public $activeMenuItem = 'wcf.page.training.ranks';

  public $templateName = 'rankList';

  public function assignVariables()
  {
    parent::assignVariables();

    list($categories, $lookupList, $hasRanks) = $this->buildLookupList();

    WCF::getTPL()->assign([
      'categories' => $categories,
      'lookup'     => $lookupList,
      'hasRanks'   => $hasRanks,
    ]);
  }

  protected function buildLookupList()
  {
    $categories = RankCache::getInstance()->getCategories();
    unset($categories[null]);

    $lookupList = [];
    $hasRanks = [];
    foreach ($categories as $category) {
      // Set up ranks
      $hasRanks[$category->categoryID] = false;
      $ranks = RankCache::getInstance()->getCategoryRanks($category->categoryID);

      $lookupList[$category->categoryID]['branches'] = [];
      $lookupList[$category->categoryID]['paygrades'] = [];

      $branches  = &$lookupList[$category->categoryID]['branches'];
      $paygrades = &$lookupList[$category->categoryID]['paygrades'];

      foreach ($ranks as $rank) {
        // Set up branches
        if (!in_array($rank->branch, $branches)) {
          $branches[] = $rank->branch;
        }

        // Set up paygrades
        if (!in_array($rank->paygrade, $paygrades)) {
          $paygrades[] = $rank->paygrade;
        }

        $lookupList[$category->categoryID]['ranks'][$rank->paygrade][$rank->branch->branchID] = $rank;
        $hasRanks[$category->categoryID] = true;
      }

      // Add null rank for branches without this rank
      foreach ($lookupList[$category->categoryID]['branches'] as $branch) {
        foreach ($lookupList[$category->categoryID]['paygrades'] as $paygrade) {
          if (!isset($lookupList[$category->categoryID]['ranks'][$paygrade][$branch->branchID])) {
            $lookupList[$category->categoryID]['ranks'][$paygrade][$branch->branchID] = 0;
          }
        }
      }
    }

    //mail('christopher@padarom.io', 'b', print_r($lookupList, true));
    return [$categories, $lookupList, $hasRanks];
  }
}