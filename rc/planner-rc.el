;;;; Planner rc file for Multi-Planner mode

;;; TODO: Clean

(setq load-path (append load-path (list "~/.elisp/planner")))

(require 'planner)
(require 'planner-multi)
(require 'planner-report)
(require 'planner-id)
;(load-file "~/.elisp/planner/planner-accomplishments.el")

(when (and (locate-library "planner")
           (locate-library "muse"))
  (setq planner-project "Todo")
  (setq planner-directory "~/doc/T/Todo")
  (setq planner-default-page "")
  (setq muse-file-extension nil muse-mode-auto-p t)
  ;; Tell muse about planner.  We use add-hook instead of
  ;; add-to-list because muse might not be loaded yet.
  (add-hook 'muse-project-alist
            (list planner-project
                  (list planner-directory
                        :default planner-default-page
                        :major-mode 'planner-mode
                        :visit-link 'planner-visit-link))))

;; Cyclic tasks (every monday)
(require 'planner-cyclic)

;; Don't queue up old tasks if they roll around again
(setq planner-cyclic-diary-nag nil)

;; Add id's so I can edit the description
(setq planner-id-add-task-id-flag t)

;; Renumber tasks
(setq planner-renumber-tasks-automatically t)

;; Carry forward all tasks
(setq planner-carry-tasks-forward 30)

;; Setup my planner-id file so it is updated along with the reast of the subversion files
(setq planner-id-tracking-file "~/doc/T/Todo/.planner-id")

;; Build my 'projects' list
(setq planner-projects (directory-files "~/doc/T/Todo" nil "[A-Z].*[^~]$"))

;; Function to print the list of projects with links
(defun planner-ed-print-projects ()
  "Print each element of my PLANNER-PROJECTS with muse links"
  (interactive)
  (setq list planner-projects) ; use temp var.
  (setq return-list "[[Projects]]\n\n[[WorkProjects]]")
;  (while list
;    (setq return-list (concat return-list (concat "[[" (car list) "]] ")))
;    (setq list (cdr list)))
  (print return-list))

(defun planner-ed-insert-projects ()
  "Insert my projects list"
  (interactive)
  (insert (planner-ed-print-projects)))

;; Home Context Template
(setq planner-home-templ "[[ComputerHome]]|[[Home]]|[[OutsideHome]]|[[ReadHome]]|[[ReadSafari]]|[[Habits]]|[[WaitingHome]]|[[SomedayHome]]\n[[Buy]]|[[Objectives]]|[[Goals]]|[[Lifetime]]\n\n")

;; Work Context Template
(setq planner-work-templ "[[WorkInbox]]|[[WorkGeneral]]|[[WorkProgramming]]|[[WorkWeb]]|[[WorkWaiting]]|[[WorkSomeday]]|[[WorkDuties]]|[[WorkGoals]]\n\n")

;; Setup my template from my variables
(setq planner-day-page-template (concat "
* Schedule\n\n\n
* Tasks\n\n\n\n" planner-home-templ (planner-ed-print-projects)))

(setq planner-plan-page-template "* Description\n\n\n* Tasks\n\n\n")


(defun planner-ed-list-tasks-with-priority-from-page (priority &optional pages)
  "Create a simple of the tasks from PAGES with PRIORITY, that
are not completed or canceled"
  (interactive (list (read-string "Priority (A, B, C): ") (read-string "Page: ")))
  (set-buffer (get-buffer-create "*Planner Tasks*"))
  (erase-buffer)
  (let (tasks)
    (setq tasks (planner-extract-tasks
                 (cond ((eq pages t)
                        (planner-file-alist))
                       ((eq pages nil)
                        (planner-get-day-pages))
                       ((not (listp pages))
                        (let ((regexp pages))
                          (setq pages nil)
                          (dolist (page (planner-file-alist))
                            (when (string-match regexp (cdr page))
                              (setq pages (cons page pages)))))
                        pages)
                       (t pages))
                 (lambda (item)
                   (string-match priority (planner-task-priority item)))))
    (while tasks
      (if (not (or 
                (equal (planner-task-status (car tasks)) "X")
                (equal (planner-task-status (car tasks)) "C")))
          (insert
           (format "* %s\n"
                   (replace-regexp-in-string "{{.+" "" (planner-task-description (car tasks))))))
      (setq tasks (cdr tasks))))
  (text-mode)
  (goto-char (point-min))
  (pop-to-buffer (current-buffer)))


;;(setq planner-day-page-template 'edavis/planner-day-page-template)
;;;_+ No more line-breaking for tasks. Thanks to Keith Amidon


;;; Create a newline for a task, good hack around using the planner-create-task-from-buffer
;; http://www.emacswiki.org/cgi-bin/wiki/PlannerModeContrib

;;;_+ Specify task priority on creation

(defadvice planner-create-task-from-buffer (before cwebber activate)
  "Change the priority if specified.
You can set the priority of a task during creation by starting the
task description with #A, #B, or #C. This changes the default task
status."
  (when (string-match "^#\\([ABC]\\)[ \t]" title)
    (setq planner-default-task-priority (match-string 1 title))
    (setq title (substring title (match-end 0)))))



(defun planner-create-task-newline ()
  "Insert a task template in the next line."
  (interactive)
  (newline)
  (insert "#B _ ")
  )

; List all of my tasks, both on date pages and
; task pages
(defun planner-list-unfinished-tasks-all ()
  "List all tasks in all files."
  (interactive)
  (planner-list-unfinished-tasks 
   (reverse
    (list "ComputerHome" "Home" "OutsideHome" "ReadHome" "ReadSafari" "Habits" "WaitingHome" "Business" "SomedayHome" "BusinessSomeday"))))

; List all my tasks for Work
(defun planner-list-unfinished-tasks-work ()
  "List all tasks in all files."
  (interactive)
  (planner-list-unfinished-tasks 
   (reverse
    (list "Business"))))

; List all my tasks for Home
(defun planner-list-unfinished-tasks-home ()
  "List all tasks in all files."
  (interactive)
  (planner-list-unfinished-tasks 
   (reverse
    (list "ComputerHome" "Home" "OutsideHome" "ReadHome" "ReadSafari" "Habits" "WaitingHome" "SomedayHome"))))


;;; Keybindings
(global-set-key (kbd "<f9> t") 'planner-create-task-from-buffer)
(global-set-key (kbd "<f9> u") 'planner-id-update-tasks-on-page)
(global-set-key (kbd "<f9> w") 'planner-list-unfinished-tasks-work)
(global-set-key (kbd "<f9> h") 'planner-list-unfinished-tasks-home)
(global-set-key (kbd "<f9> a") 'planner-list-unfinished-tasks-all)
(global-set-key (kbd "<f9> p") 'planner-ed-insert-projects)
(global-set-key (kbd "<f9> y") 'planner-replan-task) ; Prompts for an update for the contexts
;;;; Move tasks up and down 
(global-set-key (kbd "<f9> <up>") 'planner-move-up)
(global-set-key (kbd "<f9> <down>") 'planner-move-down)

(define-key planner-mode-map (kbd "C-c C-x") 'planner-task-done)
(define-key planner-mode-map (kbd "C-c C-S-x") 'planner-task-cancelled)

(define-key planner-mode-map (kbd "<f9> c") 'planner-ed-list-tasks-with-priority-from-page)

