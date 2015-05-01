from django.shortcuts import get_object_or_404, render
from django.http import HttpResponseRedirect
from django.core.urlresolvers import reverse

from .models import Choice, Question


# Create your views here.
def index(request):
    latest_questions = Question.objects.order_by('-pub_date')[:5]
    context = {'latest_questions': latest_questions}
    return render(request, 'polls/index.html', context)

def detail(request, question_id):
    return render(request, 'polls/detail.html', {
        'question': get_object_or_404(Question, pk=question_id)
        })

def results(request, question_id):
    return render(request, 'polls/results.html', {
            'question': get_object_or_404(Question, pk=question_id)
            })



def vote(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    try:
        selected_choice = question.choice_set.get(pk=request.POST['choice'])
    except (KeyError, Choice.DoesNotExist):
        return render(request, 'polls/detail.html', {
            'question': question,
            'error_message': "You didn't select a choice.",
            })
    else:
        selected_choice.votes += 1
        selected_choice.save()
        # return redirect after successfully dealing with post, avoid double post
        return HttpResponseRedirect(reverse('polls:results', args=(question.id,)))
