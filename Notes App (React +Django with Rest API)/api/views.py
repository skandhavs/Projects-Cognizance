from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Note
from .serializers import NoteSerializer
from django.views.decorators.csrf import csrf_exempt
from .utils import updateNote,getNoteInfo,deleteNote,allNotes,newNote
# Create your views here.
@csrf_exempt
@api_view(['GET'])
def getRoutes(request):

    routes = [
        {
            'Endpoint': '/notes/',
            'method': 'GET',
            'body': None,
        },
        {
            'Endpoint': '/notes/id',
            'method': 'GET',
            'body': None,
        },
        {
            'Endpoint': '/notes/create/',
            'method': 'POST',
            'body': {'body': ""},
        },
        {
            'Endpoint': '/notes/id/update/',
            'method': 'PUT',
            'body': {'body': ""},
        },
        {
            'Endpoint': '/notes/id/delete/',
            'method': 'DELETE',
            'body': None,
        },
    ]
    return Response(routes)
@csrf_exempt
@api_view(['GET','POST'])
def getNotes(request):
    if request.method == "GET":
        return allNotes(request)
    if request.method == "POST":
        return newNote(request)

@csrf_exempt        
@api_view(['GET','PUT','DELETE'])
def getNoteOnly(request,pk):
    if request.method=='GET':
        return getNoteInfo(request,pk)
    if request.method=='PUT':
        return updateNote(request,pk)
    if request.method=='DELETE':
        return deleteNote(request,pk)


