import os
import tarfile

def compress_dataset(dir, name, files):
  tgz_file = os.path.join(dir, name + '.tgz')
  with tarfile.open(tgz_file, "w:gz") as tar:
    for file in files:
      path = os.path.realpath(file)
      name = os.path.basename(path)
      tar.add(path, arcname=name)

def main():
  os.makedirs('dist', exist_ok=True)

  datasets = [
    'COUNTRIES-S1',
    'COUNTRIES-S2',
    'COUNTRIES-S3',
    'FB15K',
    'FB15K-237',
    'KINSHIP',
    'NATIONS',
    'UMLS',
    'WN18',
    'WN18RR',
    'YAGO3-10'
  ]
  for dataset in datasets:
    compress_dataset('dist', dataset + '-ID', [
      dataset + '/edges_as_id_all.tsv',
      dataset + '/edges_as_id_train.tsv',
      dataset + '/edges_as_id_test.tsv',
      dataset + '/edges_as_id_valid.tsv',
      dataset + '/map_entity_id_to_text.tsv',
      dataset + '/map_relation_id_to_text.tsv'
    ])
    compress_dataset('dist', dataset, [
      dataset + '/edges_as_text_all.tsv',
      dataset + '/edges_as_text_train.tsv',
      dataset + '/edges_as_text_test.tsv',
      dataset + '/edges_as_text_valid.tsv',
    ])


if __name__ == '__main__':
  main()
