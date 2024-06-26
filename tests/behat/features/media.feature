Feature: Check that MediaTrait works for or D9

  @api
  Scenario: Assert "When I attach the file :file to :field_name media field"
    Given managed file:
      | path                 |
      | example_document.pdf |

    And no image media:
      | name             | field_media_image |
      | Test media image | example_image.png |

    And "image" media:
      | name              | field_media_image |
      | Test media image  | example_image.png |
      | Test media image2 | example_image.png |

    And no image media:
      | name              |
      | Test media image2 |

    And "document" media:
      | name                | field_media_document |
      | Test media document | example_document.pdf |

    And I am logged in as a user with the "administrator" role
    When I visit "/admin/content/media"
    Then I should see the text "Test media image"
    Then I should not see the text "Test media image2"
    And I should see the text "Test media document"
