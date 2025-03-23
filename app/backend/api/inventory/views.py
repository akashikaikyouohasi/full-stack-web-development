from rest_framework.views import APIView
from rest_framework.exceptions import NotFound
from rest_framework.response import Response
from .models import Product, Purchase, Sales
from .serializers import ProductSerializer, PurchaseSerializer, SaleSerializer
from rest_framework import status
from rest_framework.viewsets import ModelViewSet

class ProductView(APIView):
    """
    商品操作に関する関数
    """
    # 商品操作に関する関数で共通で使用する商品取得関数
    def get_object(self, pk):
        try:
            return Product.objects.get(pk=pk)
        except Product.DoesNotExist:
            raise NotFound

    def get(self, request, id=None, fromat=None):
        """
        商品の一覧を取得するもしくは一位の商品を取得する
        """
        if id is None:
            queryset = Product.objects.all()
            serializer = ProductSerializer(queryset, many=True)
        else:
            product = self.get_object(id)
            serializer = ProductSerializer(product) # 単一の商品を取得する場合はmany=Trueを指定しない。
        return Response(serializer.data, status.HTTP_200_OK)

    # 商品を登録する
    def post(self, request, format=None):
        serializer = ProductSerializer(data=request.data)
        # validationを通らなかった場合、例外を投げる
        serializer.is_valid(raise_exception=True)
        # 検証したデータを永続化する
        serializer.save()
        return Response(serializer.data, status.HTTP_201_CREATED)
    
    def put(self, request, id, format=None):
        """
        更新
        """
        product = self.get_object(id)
        serializer = ProductSerializer(instance=product, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data, status.HTTP_200_OK)
    
    def delete(self, request, id, format=None):
        """
        削除
        """
        product = self.get_object(id)
        # データがあるということはvalidationは不要なので、is_valid()は呼び出さない
        product.delete()
        return Response(status.HTTP_200_OK)

class ProductModelViewSet(ModelViewSet):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer

class PurchaseView(APIView):
    def post(self, request, format=None):
        """
        仕入情報を登録する
        """
        serializer = PurchaseSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data, status.HTTP_201_CREATED)

class SalesView(APIView):
    def post(self, request, format=None):
        """
        売上情報を登録する
        """
        serializer = SaleSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data, status.HTTP_201_CREATED)
