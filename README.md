# README
  ## Database

  ### users

| culumns  | type             |
|:----------------------------|
| id       |integer(NOT NULL) |
| name     |string(NOT NULL)  |
| email    |text(NOT NULL)    |
| password |string(NOT NULL)  |

    #### Relation
      has_many :members, messages

  ### groups

| culumns  | type              |
|:---------|:------------------|
| id       | integer(NOT NULL) |
| name     | string(NOT NULL)  |


  ### Menbers

| culumns  | type              |
|:---------|:------------------|
| id       | integer(NOT NULL) |
| group_id | integer(NOT NULL) |
| user_id  | integer(NOT NULL) |

    #### Relation
      :members, messages



  ### messages

| culumns  | type             |
|:----------------------------|
| id       |integer(NOT NULL) |
| body     |text(NOT NULL)    |
| image    |text              |
| group_id |integer(NOT NULL) |
| user_id  |integer(NOT NULL) |

    #### Relation
      messages belongs_to :group, user

    #### Index
     add_index :messages, [:body, :image]


