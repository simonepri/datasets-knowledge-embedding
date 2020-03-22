<h1 align="center">
  <b>datasets-knowledge-embedding</b>
</h1>
<p align="center">
  <!-- License -->
  <a href="https://github.com/simonepri/datasets-knowledge-embedding/tree/master/license">
    <img src="https://img.shields.io/github/license/simonepri/datasets-knowledge-embedding.svg" alt="Project license" />
  </a>
</p>
<p align="center">
  📝 A collection of common datasets used in knowledge embedding
</p>


## Synopsis

This project collects different datasets used in various knowledge embedding related papers.
It also standardizes the format of these datasets, making it easier to use them in the evaluation of new works.

The [datasets](#datasets) can be downloaded from the [release page][release].  
For licensing information, please refer to the original dataset license file.


## Datasets format

Every subfolder in this repo is a single dataset.  
Every folder contains the following `18` files.

| File name | Description |
|-----------|-------------|
| `edges_as_text_{train,valid,test}.tsv` | These three files contain the three splits of the dataset where entities and relations are in a textual form (i.e. `italy	locatedin	europe`).   |
| `edges_as_text_all.tsv` | The concatenation of `edges_as_text_train.tsv`, `edges_as_text_valid.tsv`, and `edges_as_text_test.tsv`. |
| `edges_as_id_{train,valid,test}.tsv` | These three files contain the three splits of the dataset where entities and relations are mapped to a numerical ID (i.e. `38	1	2`). Entities and relations that are more frequent are mapped to lower integers (e.g. the entity/relation with ID `0` is the most frequent entity/relation in the dataset).   |
| `edges_as_id_all.tsv` | The concatenation of `edges_as_id_train.tsv`, `edges_as_id_valid.tsv`, and `edges_as_id_test.tsv`. |
| `map_entity_id_to_text.tsv` | This file contains the mapping from numerical IDs used for entities in `edges_as_id_*.tsv` to the textual representation used in `edges_as_text_*.tsv` (i.e. `38	italy, 2	europe`). |
| `map_relation_id_to_text.tsv` | This file contains the mapping from numerical IDs used for relations in `edges_as_id_*.tsv` to the textual representation used in `edges_as_text_*.tsv` (i.e 1	locatedin). |
| `frequency_entities_{all,train,valid,test}.tsv` | These files contain the frequency of each entity in the various splits of the dataset. |
| `frequency_relations_{all,train,valid,test}.tsv` | These files contain the frequency of each relation in the various splits of the dataset. |


## Add a new dataset

If you want to add a new dataset to this collection, first you need to create three files called `train.tsv`, `valid.tsv`, and `test.tsv` containing respectively the edges for the three splits train, validation and test.  
The files must contain tab-separated triples of the form `(head entity, relation, tail entity)`.

Once you did this, you can simply process the three files with the following bash script.

```bash
bash build.sh train.tsv valid.tsv test.tsv .
```

The script uses the [edgelist-mapper][github:simonepri/edgelist-mapper] tool under the hood.


## Datasets

The datasets are distributed in two formats, namely text-based and id-based (see the [dataset format section](#datasets-format) for the difference).

### COUNTRIES-S1
This dataset was introduced in [On Approximate Reasoning Capabilities of Low-Rank Vector Spaces](https://www.aaai.org/ocs/index.php/SSS/SSS15/paper/view/10257).  
The link to the original dataset as released by the authors is unknown but a copy has been taken from [here](https://github.com/TimDettmers/ConvE/tree/master/countries).

| Entities | Relation Types | Edges | Train Edges | Validation Edges | Test Edges |
|----------|----------------|-------|-------------|------------------|------------|
| 271 | 2 | 1159 | 1111 | 24 | 24 |

[![Download COUNTRIES-S1.tgz](https://img.shields.io/github/downloads/simonepri/datasets-knowledge-embedding/latest/COUNTRIES-S1.tgz
)](https://github.com/simonepri/datasets-knowledge-embedding/releases/latest/download/COUNTRIES-S1.tgz) [![Download COUNTRIES-S1-ID.tgz](https://img.shields.io/github/downloads/simonepri/datasets-knowledge-embedding/latest/COUNTRIES-S1-ID.tgz
)](https://github.com/simonepri/datasets-knowledge-embedding/releases/latest/download/COUNTRIES-S1-ID.tgz)


### COUNTRIES-S2
This dataset was introduced in [On Approximate Reasoning Capabilities of Low-Rank Vector Spaces](https://www.aaai.org/ocs/index.php/SSS/SSS15/paper/view/10257).  
The link to the original dataset as released by the authors is unknown but a copy has been taken from [here](https://github.com/TimDettmers/ConvE/tree/master/countries).

| Entities | Relation Types | Edges | Train Edges | Validation Edges | Test Edges |
|----------|----------------|-------|-------------|------------------|------------|
| 271 | 2 | 1111 | 1063 | 24 | 24 |

[![Download COUNTRIES-S2.tgz](https://img.shields.io/github/downloads/simonepri/datasets-knowledge-embedding/latest/COUNTRIES-S2.tgz
)](https://github.com/simonepri/datasets-knowledge-embedding/releases/latest/download/COUNTRIES-S2.tgz) [![Download COUNTRIES-S2-ID.tgz](https://img.shields.io/github/downloads/simonepri/datasets-knowledge-embedding/latest/COUNTRIES-S2-ID.tgz
)](https://github.com/simonepri/datasets-knowledge-embedding/releases/latest/download/COUNTRIES-S2-ID.tgz)

### COUNTRIES-S3
This dataset was introduced in [On Approximate Reasoning Capabilities of Low-Rank Vector Spaces](https://www.aaai.org/ocs/index.php/SSS/SSS15/paper/view/10257).  
The link to the original dataset as released by the authors is unknown but a copy has been taken from [here](https://github.com/TimDettmers/ConvE/tree/master/countries).

| Entities | Relation Types | Edges | Train Edges | Validation Edges | Test Edges |
|----------|----------------|-------|-------------|------------------|------------|
| 271 | 2 | 1033 | 985 | 24 | 24 |

[![Download COUNTRIES-S3.tgz](https://img.shields.io/github/downloads/simonepri/datasets-knowledge-embedding/latest/COUNTRIES-S3.tgz
)](https://github.com/simonepri/datasets-knowledge-embedding/releases/latest/download/COUNTRIES-S3.tgz) [![Download COUNTRIES-S3-ID.tgz](https://img.shields.io/github/downloads/simonepri/datasets-knowledge-embedding/latest/COUNTRIES-S3-ID.tgz
)](https://github.com/simonepri/datasets-knowledge-embedding/releases/latest/download/COUNTRIES-S3-ID.tgz)

### FB15K
This dataset was introduced in [Translating Embeddings for Modeling Multi-relational Data](https://dl.acm.org/doi/10.5555/2999792.2999923).  
The original dataset as released by the authors is available [here](https://everest.hds.utc.fr/doku.php?id=en:transe).

| Entities | Relation Types | Edges | Train Edges | Validation Edges | Test Edges |
|----------|----------------|-------|-------------|------------------|------------|
| 14951 | 1345 | 592213 | 483142 | 50000 | 59071 |

[![Download FB15K.tgz](https://img.shields.io/github/downloads/simonepri/datasets-knowledge-embedding/latest/FB15K.tgz
)](https://github.com/simonepri/datasets-knowledge-embedding/releases/latest/download/FB15K.tgz) [![Download FB15K-ID.tgz](https://img.shields.io/github/downloads/simonepri/datasets-knowledge-embedding/latest/FB15K-ID.tgz
)](https://github.com/simonepri/datasets-knowledge-embedding/releases/latest/download/FB15K-ID.tgz)

### FB15K-237
This dataset was introduced in [Observed versus latent features for knowledge base and text inference](https://www.aclweb.org/anthology/W15-4007/).  
The original dataset as released by the authors is available [here](https://www.microsoft.com/en-us/download/details.aspx?id=52312).

| Entities | Relation Types | Edges | Train Edges | Validation Edges | Test Edges |
|----------|----------------|-------|-------------|------------------|------------|
| 14541 | 237 | 310116 | 272115 | 17535 | 20466 |

[![Download FB15K-237.tgz](https://img.shields.io/github/downloads/simonepri/datasets-knowledge-embedding/latest/FB15K-237.tgz
)](https://github.com/simonepri/datasets-knowledge-embedding/releases/latest/download/FB15K-237.tgz) [![Download FB15K-237-ID.tgz](https://img.shields.io/github/downloads/simonepri/datasets-knowledge-embedding/latest/FB15K-237-ID.tgz
)](https://github.com/simonepri/datasets-knowledge-embedding/releases/latest/download/FB15K-237-ID.tgz)

### KINSHIP
This dataset was introduced in [Learning systems of concepts with an infinite relational model](https://dl.acm.org/doi/10.5555/1597538.1597600).  
The original dataset as released by the authors is available [here](http://www.charleskemp.com/code/irm.html).

| Entities | Relation Types | Edges | Train Edges | Validation Edges | Test Edges |
|----------|----------------|-------|-------------|------------------|------------|
| 104 | 25 | 10686 | 8544 | 1068 | 1074 |

[![Download KINSHIP.tgz](https://img.shields.io/github/downloads/simonepri/datasets-knowledge-embedding/latest/KINSHIP.tgz
)](https://github.com/simonepri/datasets-knowledge-embedding/releases/latest/download/KINSHIP.tgz) [![Download KINSHIP-ID.tgz](https://img.shields.io/github/downloads/simonepri/datasets-knowledge-embedding/latest/KINSHIP-ID.tgz
)](https://github.com/simonepri/datasets-knowledge-embedding/releases/latest/download/KINSHIP-ID.tgz)

### NATIONS
This dataset was introduced in [Learning systems of concepts with an infinite relational model](https://dl.acm.org/doi/10.5555/1597538.1597600).  
The original dataset as released by the authors is available [here](http://www.charleskemp.com/code/irm.html).

| Entities | Relation Types | Edges | Train Edges | Validation Edges | Test Edges |
|----------|----------------|-------|-------------|------------------|------------|
| 14 | 55 | 1992 | 1592 | 199 | 201 |

[![Download NATIONS.tgz](https://img.shields.io/github/downloads/simonepri/datasets-knowledge-embedding/latest/NATIONS.tgz
)](https://github.com/simonepri/datasets-knowledge-embedding/releases/latest/download/NATIONS.tgz) [![Download NATIONS-ID.tgz](https://img.shields.io/github/downloads/simonepri/datasets-knowledge-embedding/latest/NATIONS-ID.tgz
)](https://github.com/simonepri/datasets-knowledge-embedding/releases/latest/download/NATIONS-ID.tgz)

### UMLS
This dataset was introduced in [Learning systems of concepts with an infinite relational model](https://dl.acm.org/doi/10.5555/1597538.1597600).  
The original dataset as released by the authors is available [here](http://www.charleskemp.com/code/irm.html).

| Entities | Relation Types | Edges | Train Edges | Validation Edges | Test Edges |
|----------|----------------|-------|-------------|------------------|------------|
| 135 | 46 | 6529 | 5216 | 652 | 661 |

[![Download UMLS.tgz](https://img.shields.io/github/downloads/simonepri/datasets-knowledge-embedding/latest/UMLS.tgz
)](https://github.com/simonepri/datasets-knowledge-embedding/releases/latest/download/UMLS.tgz) [![Download UMLS-ID.tgz](https://img.shields.io/github/downloads/simonepri/datasets-knowledge-embedding/latest/UMLS-ID.tgz
)](https://github.com/simonepri/datasets-knowledge-embedding/releases/latest/download/UMLS-ID.tgz)

### WN18
This dataset was introduced in [Translating Embeddings for Modeling Multi-relational Data](https://dl.acm.org/doi/10.5555/2999792.2999923).  
The original dataset as released by the authors is available [here](https://everest.hds.utc.fr/doku.php?id=en:transe).

| Entities | Relation Types | Edges | Train Edges | Validation Edges | Test Edges |
|----------|----------------|-------|-------------|------------------|------------|
| 41105 | 18 | 151442 | 141442 | 5000 | 5000 |

[![Download WN18.tgz](https://img.shields.io/github/downloads/simonepri/datasets-knowledge-embedding/latest/WN18.tgz
)](https://github.com/simonepri/datasets-knowledge-embedding/releases/latest/download/WN18.tgz) [![Download WN18-ID.tgz](https://img.shields.io/github/downloads/simonepri/datasets-knowledge-embedding/latest/WN18-ID.tgz
)](https://github.com/simonepri/datasets-knowledge-embedding/releases/latest/download/WN18-ID.tgz)

### WN18RR
This dataset was introduced in [Convolutional 2D Knowledge Graph Embeddings](https://arxiv.org/abs/1707.01476).  
The original dataset as released by the authors is available [here](https://github.com/TimDettmers/ConvE).

| Entities | Relation Types | Edges | Train Edges | Validation Edges | Test Edges |
|----------|----------------|-------|-------------|------------------|------------|
| 41105 | 11 | 93003 | 86835 | 3034 | 3134 |

[![Download WN18RR.tgz](https://img.shields.io/github/downloads/simonepri/datasets-knowledge-embedding/latest/WN18RR.tgz
)](https://github.com/simonepri/datasets-knowledge-embedding/releases/latest/download/WN18RR.tgz) [![Download WN18RR-ID.tgz](https://img.shields.io/github/downloads/simonepri/datasets-knowledge-embedding/latest/WN18RR-ID.tgz
)](https://github.com/simonepri/datasets-knowledge-embedding/releases/latest/download/WN18RR-ID.tgz)

### YAGO3-10
This dataset was introduced in [Convolutional 2D Knowledge Graph Embeddings](https://arxiv.org/abs/1707.01476).  
The original dataset as released by the authors is available [here](https://github.com/TimDettmers/ConvE).

| Entities | Relation Types | Edges | Train Edges | Validation Edges | Test Edges |
|----------|----------------|-------|-------------|------------------|------------|
| 123182 | 37 | 1089040 | 1079040 | 5000 | 5000 |

[![Download YAGO3-10.tgz](https://img.shields.io/github/downloads/simonepri/datasets-knowledge-embedding/latest/YAGO3-10.tgz
)](https://github.com/simonepri/datasets-knowledge-embedding/releases/latest/download/YAGO3-10.tgz) [![Download YAGO3-10-ID.tgz](https://img.shields.io/github/downloads/simonepri/datasets-knowledge-embedding/latest/YAGO3-10-ID.tgz
)](https://github.com/simonepri/datasets-knowledge-embedding/releases/latest/download/YAGO3-10-ID.tgz)


## Authors

- **Simone Primarosa** - [simonepri][github:simonepri]

See also the list of [contributors][contributors] who participated in this project.


## License

This project is licensed under the MIT License - see the [license][license] file for details.

<!-- Links -->
[license]: https://github.com/simonepri/datasets-knowledge-embedding/tree/master/license
[contributors]: https://github.com/simonepri/datasets-knowledge-embedding/contributors
[release]: https://github.com/simonepri/datasets-knowledge-embedding/releases/latest

[github:simonepri]: https://github.com/simonepri

[github:simonepri/edgelist-mapper]: https://github.com/simonepri/edgelist-mapper
