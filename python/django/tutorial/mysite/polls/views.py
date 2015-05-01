from django.shortcuts import get_object_or_404, render

from .models import Question


# Create your views here.
def index(request):
    latest_questions = Question.objects.order_by('-pub_date')[:5]
    context = {'latest_questions': latest_questions}
    return render(request, 'polls/index.html', context)

def detail(request, question_id):
    return render(
            request, 'polls/detail.html',
            {'question': get_object_or_404(Question, pk=question_id)}
           )
