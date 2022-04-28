import json

def lambda_handler(event, context):

    response = {}
    # print(event)
    
    msg = json.loads(event['Records'][0]['body'])

    if msg['id'] > 1000:
        raise Exception(f"Message id {msg['id']} is too high")

    print(msg)
    # Response Status
    statusCode = 200
    response["statusCode"] = statusCode
    response["body"] = json.dumps(event)

    return response