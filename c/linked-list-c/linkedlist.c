#include <stdio.h>
#include <stdlib.h>

struct Node{
    int x;   
    struct Node* next;
};

struct Node* createNode(int x){
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->x = x;
    newNode->next = NULL;
    return newNode;
}

void printList(struct Node* head){
    struct Node* temp = head;
    while(temp != NULL) {
        printf("%d ", temp->x);
        temp = temp->next;
    }
    printf("\n");
}

int main() {
    struct Node* head = createNode(5);
    head->next = createNode(3);
    head->next->next = createNode(7);
    head->next->next->next = createNode(2);

    printList(head); 

    free(head->next->next->next);
    free(head->next->next);
    free(head->next);
    free(head);

    return 0;
}
