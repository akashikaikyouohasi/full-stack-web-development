from rest_framework.response import Response
from rest_framework.views import APIView

from .models import Hello

class Db(APIView):
    def get(self, request, format=None):
        # Getリクエストを受け取った時の処理
        entry = Hello.objects.get(id=1)
        return Response({"message": entry.world})
