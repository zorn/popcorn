# Glossary

## Entities

```mermaid
erDiagram
    EVENT only one to zero or many VIDEO : has
    EVENT {
        string title
        date startDate
        date endDate
        string youTubePlaylistId
    }
    VIDEO {
        string title
        string description
        string youTubeId
        datetime publishedAt
        
    }
    VIDEO only one to one or many SPEAKER : presentedBy
    SPEAKER {
        string firstName
        string lastName
    }
```

<https://mermaid.js.org/syntax/entityRelationshipDiagram.html>

## Other Terms

Some early thoughts on domain language.

* Conference/event - a specific instance of a conference. 
* Conference series/Collection - a collection of conferences. (collection might be a better word since it can connect from multiple conferences)
* Video/Talk/Presentation/Session - the specific recording being presented.
