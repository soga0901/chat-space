# README
  ## Database

  ### users

| column   | type             |
|:---------|:-----------------|
| id       |integer(NOT NULL) |
| name     |string(NOT NULL)  |
| email    |text(NOT NULL)    |
| password |string(NOT NULL)  |

  #### Association
    has_many :user_groups
    has_many :groups, :through => :user_groups
    has_many :messages


  ### groups

| column   | type              |
|:---------|:------------------|
| id       | integer(NOT NULL) |
| name     | string(NOT NULL)  |

  #### Association
    has_many :user_groups
    has_many :users, :through => :user_groups
    has_many :messages


  ### user_groups

| column   | type              |
|:---------|:------------------|
| id       | integer(NOT NULL) |
| group_id | integer(NOT NULL) |
| user_id  | integer(NOT NULL) |

  #### Association
    belongs_to :group
    belongs_to :user



  ### messages

| column   | type             |
|:---------|:-----------------|
| id       |integer(NOT NULL) |
| body     |text(NOT NULL)    |
| image    |text              |
| group_id |integer(NOT NULL) |
| user_id  |integer(NOT NULL) |

  #### Association
    belongs_to :group
    belongs_to :user


  #### Index
    add_index :messages, [:body, :image]


