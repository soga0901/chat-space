# README
  ## Database

  ### users

| columns  | type             |
|:---------|:-----------------|
| id       |integer(NOT NULL) |
| name     |string(NOT NULL)  |
| email    |text(NOT NULL)    |
| password |string(NOT NULL)  |

  #### Relation
    has_many :menbers
    has_many :messages


  ### groups

| columns  | type              |
|:---------|:------------------|
| id       | integer(NOT NULL) |
| name     | string(NOT NULL)  |

  #### Relation
    has_many :menbers
    has_many :messages


  ### Menbers

| columns  | type              |
|:---------|:------------------|
| id       | integer(NOT NULL) |
| group_id | integer(NOT NULL) |
| user_id  | integer(NOT NULL) |

  #### Relation
    belongs_to :group
    belongs_to :user



  ### messages

| columns  | type             |
|:---------|:-----------------|
| id       |integer(NOT NULL) |
| body     |text(NOT NULL)    |
| image    |text              |
| group_id |integer(NOT NULL) |
| user_id  |integer(NOT NULL) |

  #### Relation
    belongs_to :group
    belongs_to :user


  #### Index
    add_index :messages, [:body, :image]


