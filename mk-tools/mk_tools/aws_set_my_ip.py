import asyncio
from aioboto3 import Session
import argparse
import httpx
import botocore.exceptions

parser = argparse.ArgumentParser()
parser.add_argument("sg_name")
parser.add_argument("port", type=int)


async def _get_my_ip() -> str:
    async with httpx.AsyncClient() as h:
        res = await h.get("https://api.ipify.org")
        return res.content.decode("ascii") + "/32"


async def _main() -> None:
    args = parser.parse_args()
    sess = Session()
    async with sess.client("ec2") as ec2:
        g = await ec2.describe_security_groups()
        sgs = [sg for sg in g["SecurityGroups"] if sg["GroupName"] == args.sg_name]
        if sgs:
            sg = sgs[0]
        else:
            raise KeyError("not found")
        try:
            await ec2.authorize_security_group_ingress(
                GroupId=sg["GroupId"],
                IpPermissions=[
                    {
                        "IpProtocol": "tcp",
                        "FromPort": args.port,
                        "ToPort": args.port,
                        "IpRanges": [{"CidrIp": await _get_my_ip()}],
                    }
                ],
            )
        except botocore.exceptions.ClientError as e:
            if "Duplicate" in e.args[0]:
                print("Already registered")
                exit(1)
            raise e


def main() -> None:
    asyncio.run(_main())


if __name__ == "__main__":
    main()
