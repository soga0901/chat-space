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
    has_many :group_users
    has_many :groups, :through => :user_groups
    has_many :messages


  ### groups

| column   | type              |
|:---------|:------------------|
| id       | integer(NOT NULL) |
| name     | string(NOT NULL)  |

  #### Association
    has_many :group_users
    has_many :users, :through => :user_groups
    has_many :messages


  ### group_users

| column   | type                                 |
|:---------|:-------------------------------------|
| id       | integer(NOT NULL)                    |
| group_id | references :group, foreign_key: true |
| user_id  | references :user, foreign_key: true  |

  #### Association
    belongs_to :group
    belongs_to :user



  ### messages

| column   | type                                |
|:---------|:------------------------------------|
| id       |integer(NOT NULL)                    |
| body     |text(NOT NULL)                       |
| image    |text                                 |
| group_id |references :group, foreign_key: true |
| user_id  |references :user, foreign_key: true  |

  #### Association
    belongs_to :group
    belongs_to :user


  #### Index
    add_index :messages, [:body, :image]


