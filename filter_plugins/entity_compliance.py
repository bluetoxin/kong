def entity_compliance(value):
    if value.get("service") and isinstance(value.get("service"), str):
      value["service.name"] = value.pop("service")
    return value

class FilterModule(object):
    def filters(self):
        return {
            "entity_compliance": entity_compliance,
        }
