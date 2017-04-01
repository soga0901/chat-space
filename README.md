# README
  ## Database

      | users                      | groups                   | members                     | messages                    |
      |:---------------------------|:-------------------------|:----------------------------|:----------------------------|
      | id :integer(NOT NULL)      | id :integer              | id :integer(NOT NULL)       | id :integer(NOT NULL)       |
      | name :string(NOT NULL)     | name :string(NOT NULL)   | group_id :integer(NOT NULL) | body :text(NOT NULL)        |
      | email :text(NOT NULL)      |                          | user_id :integer (NOT NULL) | image :text                 |
      | password :string(NOT NULL) |                          |                             | group_id :integer(NOT NULL) |
      |                            |                          |                             | user_id :integer(NOT NULL)  |

  ### Relation
     users has_many :members, messages
     members belongs_to :user, group
     messages belongs_to :group, user

  ### Index
     add_index :messages, [:body, :image]
