from django.shortcuts import render
from rest_framework.serializers import ModelSerializer
from rest_framework.generics import ListAPIView
from .models import Item


# Serializer
class ItemSerializer(ModelSerializer):
    class Meta:
        model = Item
        fields = "__all__"

# Create your views here.
class ItemView(ListAPIView):
    model = Item
    serializer_class = ItemSerializer
    
    def get_queryset(self):
        queryset = Item.objects.all().order_by('name')
        return queryset

