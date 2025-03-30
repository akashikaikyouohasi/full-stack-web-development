from rest_framework import serializers

from .models import Product, Purchase, Sales

class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = '__all__' # 全てのフィールドを指定。個別に指定することも可能。

class PurchaseSerializer(serializers.ModelSerializer):
    class Meta:
        model = Purchase
        fields = '__all__'

class SaleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Sales
        fields = '__all__'

# 仕入れ・売上情報の一覧
# Modelに依存しないため、個別にフィールドを定義している
class InventorySelializer(serializers.Serializer):
    id = serializers.IntegerField()
    unit = serializers.IntegerField()
    quantity = serializers.IntegerField()
    type = serializers.IntegerField()
    date = serializers.DateTimeField()
