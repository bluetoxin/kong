import yaml

def pop_kong_entity(entities, entities_to_delete):
    parsed_entities = yaml.safe_load(entities['stdout'])

    for _, item_to_delete in enumerate(entities_to_delete):
        for index, item in enumerate(parsed_entities):
            if item_to_delete['name'] == item['name']:
                parsed_entities.pop(index)

    return yaml.safe_dump(parsed_entities)

class FilterModule(object):
    def filters(self):
        return {
            "pop_kong_entity": pop_kong_entity,
        }
